#!/bin/bash
# This script has been modified from https://github.com/daymet/scripts/blob/master/Bash/daymet-nc-retrieval.sh
# to download monthly summary climate datasets for:
# - total precipitation
# - min average air temperature
# - max average air temperature
# - average water vapor pressure
#
# Methods using wget and curl are shown. Each uses a resaonable
# rate limit for downloading data. Users attempting to download
# data at higher rates may be rate limited by the server. 
#
# Data is also available via the THREDDS web interface at:
# http://daymet.ornl.gov/thredds/catalog/allcf/catalog.html
#
# Citation Information is available at:
# http://daymet.ornl.gov/sites/default/files/Daymet_Reference_Citation.pdf
#
# Thanks to Pete Eby @ Oak Ridge National Lab for providing this template
# Joe McGlinchy, Earth Lab, Colorado University at Boulder

# set some variables for the URLs
# prcp="prcp"
# tmin="tmin"
# tmax="tmax"
# vp="vp"
loc="na" # can be North America (na), Hawaii (hi), or Puerto Rico (pr)


# For ranges use {start..end}
# for individul values, use: 1 2 3 4 
for year in {2002..2003}

        # do wget --limit-rate=3m http://daymet.ornl.gov/thredds/fileServer/allcf/${year}/${tile}_${year}/vp.nc -O ${tile}_${year}_vp.nc
        # An example using wget instead of curl ^^^^
        
        # comment out any curl lines for datasets you don't want to download. Also, feel free to edit the limit-rate or remove altogether
        do 
        curl --limit-rate 3M -o daymet_v3_prcp_annttl_${year}_${loc}.nc4 https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1345/daymet_v3_prcp_monttl_${year}_${loc}.nc4
        curl --limit-rate 3M -o daymet_v3_tmin_annavg_${year}_${loc}.nc4 https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1345/daymet_v3_tmin_monavg_${year}_${loc}.nc4
        curl --limit-rate 3M -o daymet_v3_tmax_annavg_${year}_${loc}.nc4 https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1345/daymet_v3_tmax_monavg_${year}_${loc}.nc4
        curl --limit-rate 3M -o daymet_v3_vp_annavg_${year}_${loc}.nc4 https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1345/daymet_v3_vp_monavg_${year}_${loc}.nc4
        done
        
        