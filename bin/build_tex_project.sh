#!/bin/sh

# Check cmd line args
cmd=`basename $0`
if [ $# -ne 1 ] && [ $# -ne 2 ]; then
  echo "Usage: $cmd <tex_file> [chapter num]" >&2
  exit 1
fi

# Texfile and project base
texfile=$1
texdir=$(dirname $1)
if [ ! -f $texfile ]; then
  echo "$cmd: file $texfile does not exists" >&2
  exit 1
fi

# Name of project
projname=$(basename $texfile .tex)

# Output directory
outdir="${HOME}/immutable/uni/output/${projname}"

# If output dir doesn't exist, create it
if [ ! -d "${outdir}" ]; then
  mkdir $outdir 
  if [ $? -ne 0 ]; then
    echo "$cmd: Couldn't create output directory ${outdir}" >&2
    exit 2
  fi
fi

# Chapter to build and output file name
if [ $# -eq 2 ]; then
  chapter=$2
  outname=${projname}_${chapter}
else
  chapter=""
  outname=${projname}
fi

# Add path to bib files and common configuration
confdir="${HOME}/mutable/uni/tools/tex/common/"
export TEXINPUTS=":${TEXINPUTS}:.:${confdir}"
export BIBINPUTS=":${BIBNPUTS}:.:${confdir}"

# IF building a single chapter, need to clear existing output since stale 
# .aux files can cause problems in this case
if [ "$chapter" != "" ]; then
  rubber --into $outdir --clean $texdir/$texfile
  if [ $? -ne 0 ]; then
    echo "Error cleaning output directory" >&2
    exit 1
  fi
fi

# Make the whole thing (which is needed even in single chapter building 
# to make the .aux files first)
rubber --into $outdir -o dvipdfm $texdir/$texfile 
if [ $? -ne 0 ]; then
  echo "Error building project" >&2
  exit 1
fi

# Build a single chapter only if required
if [ "$chapter" != "" ]; then
  rubber -f --into ${outdir} -o dvipdfm --only ${chapter} ${texdir}/${texfile}
  if [ $? -ne 0 ]; then
    echo "Error building chapter" >&2
    exit 1
  fi
fi

# Rubber doesn't allow output filename to be specified
# so move output to filename we want (if it's not already what we want)
if [ "${projname}" != "${outname}" ]; then
  mv ${outdir}/${projname}.dvi ${outdir}/${outname}.dvi
  mv ${outdir}/${projname}.pdf ${outdir}/${outname}.pdf
fi


