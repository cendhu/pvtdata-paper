# Plot: Dynamic membership and fault tolerance (2 panels, single column, horizontal)
# Style matched to dissemination_sensitivity.gnuplot
set terminal pdfcairo enhanced color font "Times,10" size 3.5,2.4
set output 'plots/combined_plot.pdf'

set multiplot layout 1,2 margins 0.10,0.93,0.28,0.88 spacing 0.14,0

# ── Common styling ──
set grid ytics lt 0 lw 1 lc rgb "#dddddd"
set border 15 lw 1.2
set xtics nomirror out scale 0.4
set ytics nomirror out scale 0.4 offset 0.8,0
set y2tics nomirror out scale 0.4 offset -0.8,0

# ── Color definitions matching paper palette ──
set style line 1 lc rgb "#2C5B84" lt 1 lw 2.0    # Phase 1: primary blue, solid
set style line 2 lc rgb "#E58A2B" dt (8,4) lw 2.5    # Phase 2: secondary orange, long dash bold
set style line 3 lc rgb "#417B45" dt (2,3) lw 2.0    # Reconciliation: green, dotted

# ═══════════════════════════════════════
# (a) Baseline: Throughput + Reconciliation
# ═══════════════════════════════════════
set xlabel "Time (s)" offset 0,0.8
set ylabel "Throughput (tx/s)" offset 2.5,0
set y2label "Recon. (%)" offset -3.5,0

set xrange [0:240]
set yrange [0:650]
set y2range [0:110]

set xtics 60 offset 0,0.3
set ytics 200
set y2tics 25

set key top left font "Times,10" spacing 1.0 samplen 1.2 width -1 box lw 1.0
unset title
set label 1 "(a) Baseline" at graph 0.5, graph -0.22 center font "Times-Bold,10"

# Phase boundary annotation
set arrow 1 from 127, graph 0 to 127, graph 1 nohead dt 4 lw 0.8 lc rgb "#888888"
set label 2 "Phase 2" at 132, 610 left font "Times-Italic,8" tc rgb "#888888"

# Reconciliation completion marker
set arrow 2 from 229, graph 0 to 229, graph 0.82 nohead dt 3 lw 1.0 lc rgb "#417B45"
set label 3 "Recon Done" at 231, graph 0.87 left font "Times,8" tc rgb "#417B45"

plot 'plots/plot_data/b_p1_tps.dat' using 1:2 with lines ls 1 title "Phase 1 TPS", \
     'plots/plot_data/b_p3_tps.dat' using 1:2 with lines ls 2 title "Phase 2 TPS", \
     'plots/plot_data/b_recon.dat' using 1:2 with lines ls 3 title "Reconciliation" axes x1y2

unset arrow
unset label

# ═══════════════════════════════════════
# (b) Stress: Throughput + Reconciliation
# ═══════════════════════════════════════
set xlabel "Time (s)" offset 0,0.8
set ylabel "Throughput (tx/s)" offset 2.5,0
set y2label "Recon. (%)" offset -3.5,0

set xrange [0:270]
set yrange [0:650]
set y2range [0:110]

set xtics 60 offset 0,0.3
set ytics 200
set y2tics 25

set key top left font "Times,10" spacing 1.0 samplen 1.2 width -1 box lw 1.0
unset title
set label 1 "(b) Stress (Failures)" at graph 0.5, graph -0.22 center font "Times-Bold,10"

# Phase boundary
set arrow 1 from 157, graph 0 to 157, graph 1 nohead dt 4 lw 0.8 lc rgb "#888888"
set label 2 "Phase 2" at 162, 610 left font "Times-Italic,8" tc rgb "#888888"

# Failure/Recovery annotations — vertical labels just above x-axis
set arrow 10 from 178, graph 0 to 178, graph 0.90 nohead dt 2 lw 0.8 lc rgb "#C43A31"
set label 10 "-org5" at 178, 80 center rotate by 90 font "Times-Bold,8" tc rgb "#C43A31"

set arrow 11 from 208, graph 0 to 208, graph 0.90 nohead dt 2 lw 0.8 lc rgb "#2C5B84"
set label 11 "+org5" at 208, 80 center rotate by 90 font "Times-Bold,8" tc rgb "#2C5B84"

set arrow 12 from 228, graph 0 to 228, graph 0.90 nohead dt 2 lw 0.8 lc rgb "#C43A31"
set label 12 "-org2" at 228, 80 center rotate by 90 font "Times-Bold,8" tc rgb "#C43A31"

set arrow 13 from 258, graph 0 to 258, graph 0.90 nohead dt 2 lw 0.8 lc rgb "#2C5B84"
set label 13 "+org2" at 258, 80 center rotate by 90 font "Times-Bold,8" tc rgb "#2C5B84"

# Reconciliation completion marker
set arrow 14 from 259, graph 0 to 259, graph 0.78 nohead dt 3 lw 1.0 lc rgb "#417B45"
set label 14 "Recon Done" at 261, graph 0.83 left font "Times,8" tc rgb "#417B45"

plot 'plots/plot_data/s_p1_tps.dat' using 1:2 with lines ls 1 title "Phase 1 TPS", \
     'plots/plot_data/s_p3_tps.dat' using 1:2 with lines ls 2 title "Phase 2 TPS", \
     'plots/plot_data/s_recon.dat' using 1:2 with lines ls 3 title "Reconciliation" axes x1y2

unset multiplot
