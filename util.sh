#! /usr/bin/env bash
# make sure this script is executable
# chmod +x /path/to/the/script
# to execute the script run "./path/to/the/script"

API_URL="http://localhost:8080/items"
LMT=80

while true; do
    # Get the current CPU and memory utilization
    CPU_UTIL=$(top -bn 1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    MEM_UTIL=$(free -b | awk '/Mem/{printf("%.1f"), ($2 - $7)/$2*100}')

    # Check if the utilization
    if (( $(echo "${CPU_UTIL} > ${LMT}" | bc -l) )) || 
    (( $(echo "${MEM_UTIL} > ${LMT}" | bc -l) )); then
        # Send an HTTP request to the API endpoint
        curl -X POST -H "Content-Type: application/json" -d '{"message": "High CPU or memory utilization!"}' ${API_URL}
    fi

    # Wait for 5 seconds
    sleep 5
done

##################
# also we can use cron job to run the script every minute
# run "crontab -e" 
# and add the following line "* * * * * sh /path/to/the/script"
# below an exemple for cronjob

# #! /usr/bin/env bash
# API_URL="http://example.com/api/alarm"
# LMT=80
# # Get the current CPU and memory utilization
# CPU_UTIL=$(top -bn 1 | grep "Cpu(s)" | awk '{print 100 - $8}')
# MEM_UTIL=$(free -b | awk '/Mem/{printf("%.1f"), ($2 - $7)/$2*100}')
# # Check if the utilization
# if (( $(echo "${CPU_UTIL} > ${LMT}" | bc -l) )) || (( $(echo "${MEM_UTIL} > ${LMT}" | bc -l) )); then
#     # Send an HTTP request to the API endpoint
#     curl -X POST -H "Content-Type: application/json" -d '{"message": "High CPU or memory utilization!"}' ${API_URL}
# fi
