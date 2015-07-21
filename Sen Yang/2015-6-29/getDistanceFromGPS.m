function dis = getDistanceFromGPS(lat_from, lon_from, lat_to, lon_to)
R = 6371000;
theta1 = degtorad(lat_from);
theta2 = degtorad(lat_to);
delta_theta = degtorad(lat_to - lat_from);
delta_lambda = degtorad(lon_to - lon_from);

a = sin(delta_theta / 2) * sin(delta_theta / 2) + cos(theta1) * cos(theta2) * sin(delta_lambda / 2) * sin(delta_lambda / 2);
c = 2 * atan2(sqrt(a), sqrt(1-a));
dis = R * c;
