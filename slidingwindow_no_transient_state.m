function [y] = myfilter(x,h)

%total = 0 % Garbage unused variable

sig_end = 32; % Length of impulse response signal (how many impulses 
            % starting at n = 1

X_window = zeros(1,5); % Garbage
% 0, 0, 0, 0, 0, 0, , 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 0, 0, 0, 0]
% OLD X --->  x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
sine1 = dsp.SineWave(1,1);
sine1.SamplesPerFrame = 1000;
x = step(sine1);
% Input signal x[n], this is a vector of arbitrary numbers, and of an
% arbitrary length, adjust this to whatever you want, it should be bigger
% than the impulse response.

% zeros_arr = zeros(1,sig_end) % Creates an array of all zeros of the same
                             % size as the impulse response length.
% x = cat(2, zeros_arr, x, zeros_arr) % Adds that array of zeros to the front 
                                    % and back of the input signal x[n].

x_len = length(x); % Length of x[n] signal.

h = ones(1,sig_end); % Impulse response vector, all impulses of height 1,
                    % starts at n = 1 and ends at sig_end, adjust sig_end 
                    % to change length of impulse response.


h_transpose = h.'; % Impulse response vector transposed (layed out 
                  % horizontally for dot producting)

for i = 1:(x_len-sig_end+1) % For loop that itterates from n = 1 to the end of x[n]
    
    
    X_window = x(i:i+sig_end-1); % Shifts the sliding window of x[n] by one
                                % unit of time.

    scale = dot(X_window,h_transpose); % Setting the variable scale to be
                                      % equal to the dot product of the 
                                      % sliding window and the transpose 
                                      % of the entire impule response.

    %total = total + scale % Garbage resulting from poor intuition

    y(i) = scale; % Adding the value of the summed dot products (of the 
                 % impulse response and window vector) to the output at 
                 % n = i for y (output).

end

subplot(3,1,1)
stem(h)
% xlim([-1 40])
% ylim([0 2])

subplot(3,1,2)
stem(x)
% xlim([-1 40])
% ylim([0 50])
xlim([-1 1001])
ylim([-2 2])

subplot(3,1,3)
stem(y)
xlim([-1 1001])
ylim([-2 2])



