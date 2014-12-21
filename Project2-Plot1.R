aggTotal <- aggregate(Emissions ~ year,NEI, sum)

png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(
        (aggTotals$Emissions),
        names.arg=aggTotal$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total PM2.5 Emissions"
        )

dev.off()
%% Yes! total emissions from PM2.5 decreased in the United States from 1999 to 2008
