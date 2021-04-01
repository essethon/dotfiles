***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

if (( ${+IPINFO_API_TOKEN***REMOVED*** )); then
***REMOVED***
    curl "ipinfo.io/${1***REMOVED***?token=${IPINFO_API_TOKEN***REMOVED***"
  ***REMOVED***
***REMOVED***
***REMOVED***
    # (( ! ${+commands[drill]***REMOVED*** )) || DNSTOOL=drill
    IP=$($DNSTOOL +short ${1***REMOVED***)
    echo ${1***REMOVED*** 'resolved to' ${IP***REMOVED***
    IP=$(echo -n $IP | grep -m1 '[0-9]\{1,3\***REMOVED***\.[0-9]\{1,3\***REMOVED***\.[0-9]\{1,3\***REMOVED***\.[0-9]\{1,3\***REMOVED***')
    curl "ipinfo.io/${IP***REMOVED***?token=${IPINFO_API_TOKEN***REMOVED***"
  ***REMOVED***
***REMOVED***
