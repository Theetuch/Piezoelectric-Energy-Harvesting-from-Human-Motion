function [voltage, time] = firstImpulse(data)
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

    voltage = mean([impulse1,impulse2,impulse3],2); %2 means the mean of each row
end