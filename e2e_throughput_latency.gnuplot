# Plot: End-to-end throughput and latency across application workloads
set terminal pdfcairo enhanced color font "Times,22" size 5,3.5
set output 'e2e_throughput_latency.pdf'

# ── Styling ──
set style fill solid 0.85 border -1
set boxwidth 0.35 absolute
set grid ytics lt 0 lw 1 lc rgb "#dddddd"
set border 15 lw 1.5
set xrange [-0.5:3.5]
set xtics nomirror out scale 0.6 offset -0.8,0
set ytics nomirror out scale 0.6 offset 1.0,0
set y2tics nomirror out scale 0.6 offset -1.0,0

# ── Margins ──
set bmargin 4.5
set lmargin 8
set rmargin 9

# ── Axes ──
set xlabel "Application Workload" offset 0,-1.0
set ylabel "Throughput (tx/s)" offset 1.9,0
set y2label "Commit Latency (s)" offset -1.5,0

set ytics 400
set y2tics 1

set yrange [0:2200]
set y2range [0:8]

set key top left font "Times,18" spacing 1.1 samplen 1.5 width 0 box lw 1

# ── Plot ──
plot "e2e_performance.txt" using ($0-0.18):2:xticlabels(1) with boxes title "PDC Throughput" lc rgb "#2C5B84", \
     "" using ($0+0.18):3 with boxes title "Public Throughput" lc rgb "#A0A0A0", \
     "" using ($0-0.18):($4/1000.0) with lines title "PDC Latency" lw 3 lc rgb "#C43A31" axes x1y2, \
     "" using ($0-0.18):($4/1000.0) with points notitle pt 7 ps 1.4 lc rgb "white" axes x1y2, \
     "" using ($0-0.18):($4/1000.0) with points notitle pt 6 ps 1.2 lc rgb "#C43A31" axes x1y2, \
     "" using ($0+0.18):($5/1000.0) with lines title "Public Latency" lw 3 lc rgb "#505050" axes x1y2, \
     "" using ($0+0.18):($5/1000.0) with points notitle pt 7 ps 1.4 lc rgb "white" axes x1y2, \
     "" using ($0+0.18):($5/1000.0) with points notitle pt 4 ps 1.2 lc rgb "#505050" axes x1y2
