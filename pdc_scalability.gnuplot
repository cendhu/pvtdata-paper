# Plot: PDC scalability – throughput and per-block validation cost vs. collection count
set terminal pdfcairo enhanced color font "Times,22" size 5,3.5
set output 'pdc_scalability.pdf'

# ── Styling ──
set style fill solid 0.85 border -1
set boxwidth 0.55 absolute
set grid ytics lt 0 lw 1 lc rgb "#dddddd"
set border 15 lw 1.5
set xrange [-0.5:6.5]
set xtics nomirror out scale 0.6 offset 0,0.3
set ytics nomirror out scale 0.6 offset 1.0,0
set y2tics nomirror out scale 0.6 offset -1.0,0

# ── Margins ──
set bmargin 4.5
set lmargin 8
set rmargin 9

# ── Axes ──
set xlabel "Number of Private Data Collections" offset 0,-0.5
set ylabel "Throughput (tx/s)" offset 1.9,0
set y2label "Validation Cost per Block (ms)" offset -1.5,0

set yrange [0:1100]
set y2range [0:900]

set ytics 200
set y2tics 150

set key top right font "Times,18" spacing 1.1 samplen 1.5 width 0 box lw 1

# ── Plot ──
plot "pdc_scalability.txt" using ($0):2:xticlabels(1) with boxes title "Throughput" lc rgb "#2C5B84", \
     "" using ($0):($4*1000.0) with linespoints title "Validation Cost" lw 3 pt 4 ps 1.4 lc rgb "#C43A31" axes x1y2
