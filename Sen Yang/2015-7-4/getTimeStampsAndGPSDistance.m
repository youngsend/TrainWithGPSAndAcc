function [TimeStamps, Distance, Velocity] = getTimeStampsAndGPSDistance(gpsdata)
times = gpsdata(:,1);
lats = gpsdata(:,2);
lons = gpsdata(:,3);

m = size(lats, 1);
i = 1;
while(lats(i) == 0)
	i = i+1;
end

lat1 = lats(i);
lon1 = lons(i);
TimeStamps = [times(i)];
Distance = [0];
flag = 0;

while(i<m)
	while(lats(i) == lat1)
		i = i+1;
		if (i == m)
			flag = 1;
			break;
		end
	end
	if (flag == 1)
		break;
	end
	lat2 = lats(i);
	lon2 = lons(i);
	dis = getDistanceFromGPS(lat1, lon1, lat2, lon2);
	TimeStamps = [TimeStamps; times(i)];
	Distance = [Distance; dis];
	lat1 = lat2;
	lon1 = lon2;
end

n = size(Distance, 1);
Velocity = zeros(n-1, 1);
for i=1:n-1,
	duration = TimeStamps(i+1) - TimeStamps(i);
	if (TimeStamps(i+1) < TimeStamps(i))
		duration = TimeStamps(i+1) + 60 - TimeStamps(i);
	end
	Velocity(i) = Distance(i+1) / duration;
end

end
	
	
