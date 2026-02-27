# Output settings
set terminal pdfcairo size 10, 4 font 'Helvetica,10'
set output 'reconciliation_results.pdf'

# Layout: 1 row, 2 columns
set multiplot layout 1,2 title 'Dynamic Membership and Reconciliation Resilience' font 'Helvetica-Bold,12' offset 0, -0.5

# Shared Axis Settings
set xlabel 'Time (s from experiment start)'
set ylabel 'Throughput (TPS)'
set y2label 'Reconciliation Progress (%)'
set ytics nomirror
set y2tics 0, 20, 100
set grid y
set key top left font ',8' box opaque
set lmargin 10
set rmargin 10

# Color and Style Definitions
set style line 1 lc rgb '#1f77b4' lt 1 lw 1.5   # Phase 1
set style line 2 lc rgb '#ff7f0e' lt 1 lw 1.5   # Phase 2
set style line 3 lc rgb '#2ca02c' lt 1 lw 2     # Reconciliation Line

# --- (a) Baseline Scenario ---
set title '(a) Baseline (No Failures)'
# Vertical line for reconciliation completion
set arrow 1 from 228.9, graph 0 to 228.9, graph 1 nohead dt 3 lc rgb '#1e7b1e'
set label 1 'Recon Complete' at 228.9, graph 0.9 offset -8.5,0 font ',8' textcolor rgb '#1e7b1e'

plot 'plot_data/b1.dat' with lines ls 1 title 'Phase 1 (Populate)', 
     'plot_data/b3.dat' with lines ls 2 title 'Phase 2 (Concurrent)', 
     'plot_data/b_recon.dat' axes x1y2 with lines ls 3 title 'Reconciliation Progress'

# --- (b) Stress Scenario ---
unset arrow
unset label
set title '(b) Stress (Dynamic Failures)'

# Failure/Recovery Events (Annotations)
set arrow 1 from 177.9, graph 0 to 177.9, graph 1 nohead dt 2 lc rgb 'red'
set label 1 '-org5' at 177.9, graph 0.35 rotate by 90 offset 0.5,0 font ',8' textcolor rgb 'red'
set arrow 2 from 207.9, graph 0 to 207.9, graph 1 nohead dt 2 lc rgb 'blue'
set label 2 '+org5' at 207.9, graph 0.35 rotate by 90 offset 0.5,0 font ',8' textcolor rgb 'blue'
set arrow 3 from 227.9, graph 0 to 227.9, graph 1 nohead dt 2 lc rgb 'red'
set label 3 '-org2' at 227.9, graph 0.15 rotate by 90 offset 0.5,0 font ',8' textcolor rgb 'red'
set arrow 4 from 257.9, graph 0 to 257.9, graph 1 nohead dt 2 lc rgb 'blue'
set label 4 '+org2' at 257.9, graph 0.15 rotate by 90 offset 0.5,0 font ',8' textcolor rgb 'blue'

# Reconciliation Completion Marker
set arrow 7 from 258.8, graph 0 to 258.8, graph 1 nohead dt 3 lc rgb '#1e7b1e'
set label 7 'Recon Complete' at 258.8, graph 0.9 offset -8.5,0 font ',8' textcolor rgb '#1e7b1e'

plot 'plot_data/s1.dat' with lines ls 1 title 'Phase 1 (Populate)', 
     'plot_data/s3.dat' with lines ls 2 title 'Phase 2 (Concurrent)', 
     'plot_data/s_recon.dat' axes x1y2 with lines ls 3 title 'Reconciliation Progress'

unset multiplot
