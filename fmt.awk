{
  n=0
  i=1
  while(i<=NF) {
    if(substr($i,1,1)=="&" || substr($i,1,3)=="/**") {
      ++n
      pairs[NR][n]=$i
      i++
      while(i<=NF && substr($i,1,1)!="&" && substr($i,1,3)!="/**") {
        pairs[NR][n]=pairs[NR][n]" "$i
        i++
      }
    } else {
      i++
    }
  }
  npairs[NR]=n
  if(n>max) max=n
}
END {
  for(c=1;c<=max;c++)
    for(r=1;r<=NR;r++)
      if(length(pairs[r][c])>w[c]) w[c]=length(pairs[r][c])
  for(r=1;r<=NR;r++) {
    printf "%16s", ""
    for(c=1;c<=npairs[r];c++) {
      sep=(c<npairs[r]) ? "   " : ""
      printf "%-"w[c]"s%s", pairs[r][c], sep
    }
    print ""
  }
}
