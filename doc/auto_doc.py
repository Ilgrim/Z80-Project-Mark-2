#!/usr/bin/env python
# -*- coding: utf-8 -*-

# auto_doc.py

# Automatically generates documentation for Z80 assembly routines that have been
# properly commented in the code.  Output is a .tex file containing LaTeX
# markup.  This is named "z80_functions.tex", and is stored in the doc
# directory.  Input by default is all .z8a files in the current folder, this can
# be overridden by providing a list of files as command line arguments to the
# script.  In this case files will processed in the order they appear in the
# command.
#
# Format characters can be used surrounding text to adjust the LaTeX markup,
# *text* => \textbf{text}
# |text| => \texttt{text}
# /text/ => \textit{text}
#
# Commenting rules:
# An externally callable function (i.e. one to be documented) must have a title
# commented with a single ; then a full row of eqauls symbols (=).  Following
# this should be a single ;, a space then the function label.  A dash (-) may
# then be included and followed by a multi-line summary of the function.  After
# this summary there must be another line of equals.  There can be no
# un-commented lines between the two rows of equals symbols.
#
# After this title any blank lines are ignored.  If any lines with double
# comment characters are found, these are taken to be a description of the
# subroutine and concatenated into description.  Any single or uncommented lines
# (except blank lines) signal the end of this description.  A label is then
# sought.
#
# A label may appear on any line from the first following the end of title mark
# A label is any set of alphanumeric characters and underscores followed by a
# colon.  This first label is taken to be the location of the routine and the
# line number of this label will appear in the documentation.
#
# This file also runs the assembler on the current source to generate a label
# file.  It then uses this to document the absolute binary address of labels if
# it can find them.
#

import os, sys, copy, subprocess

# latexescape - replaces special characters with latex escape sequences
def latexescape(s):
  escapes = "\\_><^%{}$#"
  replaces = ["\\\\", "\\_", "\\textgreater ", "\\textless ", "\\^", "\\%",
              "\\{", "\\}", "\\$", "\\#"]
  for c in escapes:
    s = s.replace(c, replaces[escapes.index(c)])
  return s

def formatchars(s):
  out = ""
  buf = ""
  informat = False
  for c in s:
    if informat:
      if c.lower() in "abcdefghijklmnopqrstuvwxyz0123456789 ":
        buf += c
      elif c == format:
        if buf == "":
          # not a format character, just a pair of them e.g. A**B
          out += format + c
          informat = False
        else:
          # end of format section, add latex to buf and put in output
          if c == "*":
            out += "\\textbf{"
          elif c == "|":
            out += "\\texttt{"
          elif c == "/":
            out += "\\textit{"
          out += buf
          buf = ""
          out += "}"
          informat = False
      else:
        # illegal character, not a format marker, push buf to output
        out += format + buf + c
        buf = ""
        informat = False
    else:
      if c in "|/*":
        informat = True
        format = c
      else:
        out += c
  return out

def formatcharsremove(s):
  out = ""
  buf = ""
  informat = False
  for c in s:
    if informat:
      if c.lower() in "abcdefghijklmnopqrstuvwxyz0123456789 ":
        buf += c
      elif c == format:
        if buf == "":
          # not a format character, just a pair of them e.g. A**B
          out += format + c
          informat = False
        else:
          # end of format section, add latex to buf and put in output
          out += buf
          buf = ""
          informat = False
      else:
        # illegal character, not a format marker, push buf to output
        out += format + buf + c
        buf = ""
        informat = False
    else:
      if c in "|/*":
        informat = True
        format = c
      else:
        out += c
  return out

# run z80asm to generatee the label file
cmd = "cd " + os.path.join(sys.path[0], "../z80") + "; "
cmd += "z80asm -Lbios.lbl bios.z8a -o bios.bin"
pr = subprocess.Popen(cmd, shell=True)
pr.wait()

# now make a nice associative array of the files
labels = {}
fr = file(os.path.join(sys.path[0], "../z80/bios.lbl"), "r")
d = fr.read()
fr.close()
d = d.splitlines()
for line in d:
  parts = line.rsplit("equ", 1)
  if len(parts) == 2:
    labels[parts[0].strip()[:-1]] = parts[1].strip()

# set up file read list
if len(sys.argv) < 2:
  # list all
  files = os.listdir("./")
else:
  # list only the ones in the arguments
  files = sys.argv[1:]

sfiles = []
# verify the list contains only source files
for f in files:
  if f[-4:] == ".z8a":
    sfiles.append(f)

if sfiles == []:
  print "No valid files."
  sys.exit(0)

fw = file(os.path.join(sys.path[0], "z80_functions.tex"), "w")


titles = {"var": [], "sub": []}
descriptions = {"var": [], "sub": []}
line_nums = {"var": [], "sub": []}
infile = {"var": [], "sub": []}
label = {"var": [], "sub": []}
summarys = {"var": [], "sub": []}
memloc = {"var": [], "sub": []}

# now process each file in turn and write the output
for f in sfiles:
  output = ""
  fr = file(f, "r")
  d = fr.read()
  fr.close()

  d = d.splitlines()

  # now look for function headings, marked by ";" + "-" * 79
  line_type = "unspec"
  n = 1         # start at line 1
  for line in d:
    if line.strip() != "":              # generally ignore blank lines
      if line_type == "unspec":
        if line.strip() == (";" + "=" * 79):
          # next line is a title
          line_type = "title"
          title = ""
          labeltype = "sub"
        elif line.strip() == (";" + "*" * 79):
          # static memory location
          line_type = "title"
          title = ""
          labeltype = "var"
      elif line_type == "title":
        if line[0] == ";":
          title = line[2:].strip()
          line_type = "posttitle"
        else:
          line_type = "unspec"
      elif line_type == "posttitle":
        if line[0] != ";":
          line_type == "unspec"  # if it's really a title must have a closing line
        else:
          if (line == (";" + "=" * 79)) or (line == (";" + "*" * 79)):
            # close title, save the title
            titles[labeltype].append(title)
            infile[labeltype].append(f)
            line_type = "desc"
            desc = ""
          else:
            # multi-line title
            title += " " + line[1:].strip()
      elif line_type == "desc":
        # description
        if line[0:2] != ";;":
          # no longer printable documentation, save and look for label
          descriptions[labeltype].append(desc)
          line_type = "label"
        else:
          # documentation line
          desc += line[2:]
      if line_type == "label":
        # looking for a label
        line = line.strip()
        if (line[0] != ";"):
          # see if it's a valid label, otherwise it's code
          i = 0
          c = line[0]
          lbl = ""
          while True:
            lbl += c
            if not (c in "abcdefghijklmnopqrstuvwxyz0123456789_-"):
              if c == ":":
                # it's a valid label, save the line_number
                line_nums[labeltype].append(n)
                label[labeltype].append(lbl[:-1])
                break
              else:
                # not a valid label
                line_nums[labeltype].append(-1)
                label[labeltype].append("??")
                break
            i += 1
            if i == len(line):
              # end of line and no label found, exit
              line_nums[labeltype].append(-1)
              label[labeltype].append("??")
              break
            c = line.lower()[i]
          line_type = "unspec"    # look for next function
    # keep a line count for reference
    n += 1

# now save the list of functions and variables
# save in several formats
# 1. Main list, alphabetical by function name, with descriptions
# 2. Alphabetical list of variable locations
# 3. Table of functions and variables by file
# 4. Table of functions by memory location
# 5. Table of variables by memory location

# pre-processing: Make a list of memory locations with the same index
# then make a list of summarys, and just title in the title field

for l in label['var']:
  if labels.has_key(l):
    memloc['var'].append(labels[l])
  else:
    memloc['var'].append("$????")

for l in label['sub']:
  if labels.has_key(l):
    memloc['sub'].append(labels[l])
  else:
    memloc['sub'].append("$????")

for i in range(len(titles['var'])):
  o = titles['var'][i].split("-", 1)
  t = o[0]
  t = t.strip()
  t = latexescape(t)

  if len(o) > 1:
    s = o[1]
    s = s.strip()
    s = latexescape(s)
  else:
    s = ""

  titles['var'][i] = t
  summarys['var'].append(s)
for i in range(len(titles['sub'])):
  o = titles['sub'][i].split("-", 1)
  t = o[0]
  t = t.strip()
  t = latexescape(t)

  if len(o) > 1:
    s = o[1]
    s = s.strip()
    s = latexescape(s)
  else:
    s = ""

  titles['sub'][i] = t
  summarys['sub'].append(s)

# 1. alphabetical by function name
a = copy.copy(titles['sub'])
a.sort()

b = []
for t in a:
  b.append(titles['sub'].index(t))

if len(b) > 0:
  fw.write("\\section{Alphabetical List of Functions}\n")  # save filename

  fw.write("\\begin{tabular}{rllp{7cm}}\n")
  fw.write(" \\textbf{Source}&\\textbf{Function}&" + 
            "\\textbf{Address}&\\textbf{Description}\\\\\n")
  for i in b:
    fw.write(" %s:%d&%s&%s&%s\\\\\n" % (latexescape(infile['sub'][i]),
                                        line_nums['sub'][i],
                                        titles['sub'][i],
                                        latexescape(memloc['sub'][i]),
                                        formatchars(summarys['sub'][i])))
  fw.write("\\end{tabular}\n\n")

  # now fill in the actual entries
  for i in b:

    if line_nums['sub'][i] > -1:
      loc = "%s:%d" % (infile['sub'][i], line_nums['sub'][i])
    else:
      loc = "%s:??" % f

    loc = latexescape(loc)

    fw.write("\\subsection{%s}\n" % titles['sub'][i])
    fw.write("\\textit{%s - %s}\n\n" % (loc, latexescape(memloc['sub'][i])))
    if summarys['sub'][i] != "":
      fw.write("\\noindent\n\\textbf{%s}\n\n" % 
                formatcharsremove(latexescape(summarys['sub'][i])))

    desc = descriptions['sub'][i]
    desc = latexescape(desc)
    desc = formatchars(desc)
    if desc == "":
      dt = "No Documentation"
    else:
      dt = "Description:"
    fw.write("\\subsubsection{%s}\n" % dt)
    if desc != "":
      fw.write(desc)
    fw.write("\n\n")

# now an alphabetical list of variable locations

a = copy.copy(titles['var'])

a.sort()

b = []

for i in a:
  b.append(titles['var'].index(i))

if len(b) > 0:
  fw.write("\\section{Alphabetical List  of Variables}\n")

  fw.write("\\begin{tabular}{rllp{7cm}}\n")
  fw.write(" \\textbf{Source}&\\textbf{Function}&" + 
            "\\textbf{Address}&\\textbf{Description}\\\\\n")
  for i in b:
    fw.write(" %s:%d&%s&%s&%s\\\\\n" % (latexescape(infile['var'][i]),
                                        line_nums['var'][i],
                                        titles['var'][i],
                                        latexescape(memloc['var'][i]),
                                        formatchars(summarys['var'][i])))
  fw.write("\\end{tabular}\n\n")

  # now fill in the actual entries
  for i in b:

    if line_nums['var'][i] > -1:
      loc = "%s:%d" % (infile['var'][i], line_nums['var'][i])
    else:
      loc = "%s:??" % f

    loc = latexescape(loc)

    fw.write("\\subsection{%s}\n" % titles['var'][i])
    fw.write("\\textit{%s - %s}\n\n" % (loc, latexescape(memloc['var'][i])))
    if summarys['var'][i] != "":
      fw.write("\\noindent\n\\textbf{%s}\n\n" % 
               formatcharsremove(latexescape(summarys['var'][i])))

    desc = descriptions['var'][i]
    desc = latexescape(desc)
    desc = formatchars(desc)
    if desc == "":
      dt = "No Documentation"
    else:
      dt = "Description:"
    fw.write("\\subsubsection{%s}\n" % dt)
    if desc != "":
      fw.write(desc)
    fw.write("\n\n")

# 3. Table of functions and variables by file

a = copy.copy(titles['sub'])
a.sort()

b = []
for i in a:
  b.append(titles['sub'].index(i))

c = copy.copy(titles['var'])
c.sort()

d = []
for i in c:
  d.append(titles['var'].index(i))

fw.write("\\section{Functions and Variables by Source File}\n")  # save filename
for f in sfiles:
  fw.write("\\subsection{%s}\n" % latexescape(f))
  fw.write("\\subsubsection{Functions}\n")

  fw.write("\\begin{tabular}{rllp{7cm}}\n")
  fw.write(" \\textbf{Source}&\\textbf{Function}&" + 
            "\\textbf{Address}&\\textbf{Description}\\\\\n")
  for i in b:
    if infile['sub'][i] == f:
      fw.write(" %d&%s&%s&%s\\\\\n" % (line_nums['sub'][i],
                                          titles['sub'][i],
                                          latexescape(memloc['sub'][i]),
                                          formatchars(summarys['sub'][i])))
  fw.write("\\end{tabular}\n\n")

  fw.write("\\subsubsection{Variables}\n")

  fw.write("\\begin{tabular}{rllp{7cm}}\n")
  fw.write(" \\textbf{Source}&\\textbf{Variable}&" + 
            "\\textbf{Address}&\\textbf{Description}\\\\\n")
  for i in d:
    if infile['var'][i] == f:
      fw.write(" %d&%s&%s&%s\\\\\n" % (line_nums['var'][i],
                                          titles['var'][i],
                                          latexescape(memloc['var'][i]),
                                          formatchars(summarys['var'][i])))
  fw.write("\\end{tabular}\n\n")

# 4. Table of functions by memory location

a = copy.copy(memloc['sub'])
a.sort()

b = []
for i in a:
  b.append(memloc['sub'].index(i))

fw.write("\\section{Functions by Memory Location}\n")
fw.write("\\begin{tabular}{rllp{7cm}}\n")
fw.write(" \\textbf{Source}&\\textbf{Function}&" + 
         "\\textbf{Address}&\\textbf{Description}\\\\\n")
for i in b:
  fw.write(" %s:%d&%s&%s&%s\\\\\n" % (latexescape(infile['sub'][i]),
                                          line_nums['sub'][i],
                                          titles['sub'][i],
                                          latexescape(memloc['sub'][i]),
                                          formatchars(summarys['sub'][i])))
fw.write("\\end{tabular}\n\n")

# 5. Table of Variables by memory location

a = copy.copy(memloc['var'])
a.sort()

b = []
for i in a:
  b.append(memloc['var'].index(i))

fw.write("\\section{Variables by Memory Location}\n")
fw.write("\\begin{tabular}{rllp{7cm}}\n")
fw.write(" \\textbf{Source}&\\textbf{Variable}&" + 
         "\\textbf{Address}&\\textbf{Description}\\\\\n")
for i in b:
  fw.write(" %s:%d&%s&%s&%s\\\\\n" % (latexescape(infile['var'][i]),
                                      line_nums['var'][i],
                                      titles['var'][i],
                                      latexescape(memloc['var'][i]),
                                      formatchars(summarys['var'][i])))
fw.write("\\end{tabular}\n\n")
