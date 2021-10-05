year = c(~)
mon = c(~)

n = length(year)
for(i in 1:n) {
    for (j in 1:12) {
        url_01 = paste0(~,year[i])
        url_02 = paste0(url_01, "", mon[j], "")
        url_02
    }
}