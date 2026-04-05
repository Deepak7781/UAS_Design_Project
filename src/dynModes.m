function [eigLon,eigLat] = dynModes(lon_sys, lat_sys)
A_lon = lon_sys.A;
A_lat = lat_sys.A;
eigLon = eig(A_lon);
eigLat = eig(A_lat);
end
