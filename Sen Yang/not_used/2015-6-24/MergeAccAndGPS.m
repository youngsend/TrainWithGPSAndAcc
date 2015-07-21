function [F, V] = MergeAccAndGPS(TAcc, TGPS, VGPS)
m1 = size(TAcc, 1);
m2 = size(TGPS, 1);

for i=1:m1-1,
	if(TAcc(i) > TAcc(i+1))
		TAcc = [TAcc(1:i);TAcc(i+1:m1)+60];
	end
end

for i=1:m2-1,
	if(TGPS(i) > TGPS(i+1))
		TGPS = [TGPS(1:i);TGPS(i+1:m2)+60];
	end
end

F = [];
V = [];

j = 1;
for i=1:m2-1,
	start = TGPS(i);
	stop = TGPS(i+1);
	while(TAcc(j) < start)
		j = j+1;
	end
	while((j<m1) & (TAcc(j+1) < stop))
		t = TAcc(j+1) - TAcc(j);
		f = 1 / t;
		j = j+1;
		if (VGPS(i) > 2.3 | f > 3 | VGPS(i) < 0.8)
			break;
		else
			V = [V; VGPS(i)];
			F = [F; f];
		end
	end
end
end

