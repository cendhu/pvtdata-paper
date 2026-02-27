# Plot: Dissemination parameter sensitivity (EQ3)
# 4 panels in a single row, optimized for \textwidth in a 2-column paper
set terminal pdfcairo enhanced color font "Times,13" size 10,2.6
set output 'dissemination_sensitivity.pdf'

set multiplot layout 1,4 margins 0.06,0.94,0.25,0.92 spacing 0.08,0

# ── Common styling ──
set style fill solid 0.85 border -1
set boxwidth 0.55 absolute
set grid ytics lt 0 lw 1 lc rgb "#dddddd"
set border 15 lw 1.5
set xrange [-0.5:4.5]
set xtics nomirror out scale 0.6
set ytics nomirror out scale 0.6 offset 1.2,0
set y2tics nomirror out scale 0.6 offset -1.5,0

# ── Closer labels ──
set xlabel offset 0,1.0
set xtics offset 0,0.3
set ylabel offset 3.5,0
set y2label offset -3.5,0

# ═══════════════════════════════════════
# (a) Pull: Throughput + Commit Latency
# ═══════════════════════════════════════
set xlabel "{/Times-Italic n}_{dissem}"
set ylabel "Throughput (tx/s)"
set y2label "Commit Latency (s)"

set xtics ("0" 0, "4" 1, "9" 2, "14" 3, "19" 4)
set ytics 250
set y2tics 50

set yrange [0:1100]
set y2range [0:250]

# Legend closer to box (inside)
set key top left font "Times,12" spacing 1.0 samplen 1.2 width -1 box lw 1
unset title
set label 1 "(a) Pull: Throughput" at graph 0.5, graph -0.25 center font "Times-Bold,13"

#set label 2 "data loss" at 0,198 center offset 0,1.5 font "Times,10" tc rgb "#cc0000"
#set label 3 "data loss" at 1,229 center offset 0,1.5 font "Times,10" tc rgb "#cc0000"
#set label 4 "data loss" at 2,211 center offset 0,1.5 font "Times,10" tc rgb "#cc0000"
#set label 5 "data loss" at 3,239 center offset 0,1.5 font "Times,10" tc rgb "#cc0000"

plot "dissemination_sensitivity.txt" using ($0):2 with boxes title "Throughput" lc rgb "#2C5B84", \
     "" using ($0):4 with linespoints title "Commit Lat." lw 3 pt 4 ps 1.2 lc rgb "#C43A31" axes x1y2

unset label 1
unset label 2
unset label 3
unset label 4
unset label 5

# ═══════════════════════════════════════
# (b) Pull: Proposal Latency + Disk Writes
# ═══════════════════════════════════════
set xlabel "{/Times-Italic n}_{dissem}"
set ylabel "Proposal Latency (ms)"
set y2label "Disk Writes (GB)"

set ytics 300
set y2tics 15

set yrange [0:1300]
set y2range [0:60]

set key top left font "Times,12" spacing 1.0 samplen 1.2 width -1 box lw 1
unset title
set label 1 "(b) Pull: Endorsement" at graph 0.5, graph -0.25 center font "Times-Bold,13"

plot "dissemination_sensitivity.txt" using ($0):3 with boxes title "Prop. Lat." lc rgb "#E58A2B", \
     "" using ($0):5 with linespoints title "Disk Writes" lw 3 pt 3 ps 1.2 lc rgb "#417B45" axes x1y2

# ═══════════════════════════════════════
# (c) Push: Throughput + Commit Latency
# ═══════════════════════════════════════
set xlabel "{/Times-Italic n}_{required}"
set ylabel "Throughput (tx/s)"
set y2label "Commit Latency (s)"

set ytics 250
set y2tics 20

set yrange [0:1100]
set y2range [0:60]

set key top right font "Times,12" spacing 1.0 samplen 1.2 width -1 box lw 1
unset title
set label 1 "(c) Push: Throughput" at graph 0.5, graph -0.25 center font "Times-Bold,13"

plot "dissemination_sensitivity_push.txt" using ($0):2 with boxes title "Throughput" lc rgb "#2C5B84", \
     "" using ($0):4 with linespoints title "Commit Lat." lw 3 pt 4 ps 1.2 lc rgb "#C43A31" axes x1y2

# ═══════════════════════════════════════
# (d) Push: Proposal Latency + Disk Writes
# ═══════════════════════════════════════
set xlabel "{/Times-Italic n}_{required}"
set ylabel "Proposal Latency (ms)"
set y2label "Disk Writes (GB)"

set ytics 300
set y2tics 15

set yrange [0:1300]
set y2range [0:60]

set key top left font "Times,12" spacing 1.0 samplen 1.2 width -1 box lw 1
unset title
set label 1 "(d) Push: Endorsement" at graph 0.5, graph -0.25 center font "Times-Bold,13"

plot "dissemination_sensitivity_push.txt" using ($0):3 with boxes title "Prop. Lat." lc rgb "#E58A2B", \
     "" using ($0):5 with linespoints title "Disk Writes" lw 3 pt 3 ps 1.2 lc rgb "#417B45" axes x1y2

unset multiplot
