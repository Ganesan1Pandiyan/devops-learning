#!/bin/bash
# Log Report Script - Ganesan

LOG="app.log"
REPORT="report.txt"

TOTAL=$(wc -l < $LOG)
ERRORS=$(grep -c ERROR $LOG)
WARNS=$(grep -c WARN $LOG)
INFOS=$(grep -c INFO $LOG)

echo "===== Log Report =====" > $REPORT
echo "Date: $(date)" >> $REPORT

echo "Total lines: $TOTAL" >> $REPORT
echo "ERROR: $ERRORS" >> $REPORT
echo "WARN : $WARNS" >> $REPORT
echo "INFO : $INFOS" >> $REPORT
echo "" >> $REPORT
echo "--- Disk usage ---" >> $REPORT
df -h / >> $REPORT
echo "--- Error details ---" >> $REPORT
grep ERROR $LOG >> $REPORT

echo "Report created: $REPORT"

