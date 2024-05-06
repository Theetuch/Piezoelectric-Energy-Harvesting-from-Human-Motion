function [energy_avg, sum_Energy_avg, power_avg, time] = data2energyStack(data,r)
    %extract voltage data from each experiment
    volt1 = data(:,3);
    volt2 = data(:,6);
    volt3 = data(:,9);
    
    %find first peak
    [peak1, peak1_loc] = max(volt1);
    [peak2, peak2_loc] = max(volt2);
    [peak3, peak3_loc] = max(volt3);

    %extract data from the first peak
    window_size = 150; %assume the window size. can vary until it cover full pulse
 %ตอนแรกเป็น window/5
    start_index1 = peak1_loc - window_size/5;
    start_index2 = peak2_loc - window_size/5;
    start_index3 = peak3_loc - window_size/5;

    end_index1 = peak1_loc + window_size/2;
    end_index2 = peak2_loc + window_size/2;
    end_index3 = peak3_loc + window_size/2;

    time = data(1:end_index1 - start_index1 +1,2); %new time value that have the same length of the peak data
    impulse1 = volt1(start_index1:end_index1);
    impulse2 = volt2(start_index2:end_index2);
    impulse3 = volt3(start_index3:end_index3);

    [energy1, sum_Energy1, power1] = volt2energy(impulse1,time,r);
    [energy2, sum_Energy2, power2] = volt2energy(impulse2,time,r);
    [energy3, sum_Energy3, power3] = volt2energy(impulse3,time,r);

    energy_avg = mean([energy1;energy2;energy3]);
    sum_Energy_avg = mean([sum_Energy1, sum_Energy2, sum_Energy3],'all');
    power_avg = sum_Energy_avg/(time(end)-time(1));
    %power_avg = mean([power1, power2, power3],'all');

end