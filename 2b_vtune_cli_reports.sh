#vtune -report hotspots -r r000hs -group-by source-line
vtune -report hotspots -r r000hs -group-by source-line > reports/hotspots.report
vtune -report top-down -r r000hs > reports/top_down.report
vtune -report callstacks -r r000hs > reports/callstacks.report