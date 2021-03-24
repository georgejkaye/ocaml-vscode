open Unix

let current_time = gmtime (time ())
let day = current_time.tm_mday
let month = current_time.tm_mon + 1
let year = current_time.tm_year + 1900

let age d m y =  
    if m > month || d > day
    then year - y - 1
    else year - y