function [Energy, sum_Energy, Power_avg] = volt2energy(voltage,time,r)
    Energy = zeros(1,length(time));
    sum_Energy = 0;
    delta_t = time(2) - time(1);
    for i = 1:length(time)
        sum_Energy = sum_Energy + voltage(i)^2 / r * delta_t;
        Energy(i) = sum_Energy;
    end
    Power_avg = (Energy(end) - Energy(1)) / (time(end) - time(1));
end