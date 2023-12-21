function [y] = myfilter(x,h)

sampling_rate = 1000;



f = 1;
t = 0:(1/sampling_rate):1; 
x = sin(2*pi*t*f);





h = [-0.57534026E-02,0.99026691E-03,0.75733471E-02,-0.65141204E-02,0.13960509E-01,0.22951644E-02,-0.19994041E-01,0.71369656E-02,-0.39657373E-01,0.11260066E-01,0.66233635E-01,-0.10497202E-01,0.85136160E-01,-0.12024988E+00,-0.29678580E+00,0.30410913E+00,0.30410913E+00,-0.29678580E+00,-0.12024988E+00,0.85136160E-01,-0.10497202E-01,0.66233635E-01,0.11260066E-01,-0.39657373E-01,0.71369656E-02,-0.19994041E-01,0.22951644E-02,0.13960509E-01,-0.65141204E-02,0.75733471E-02,0.99026691E-03,-0.57534026E-02];




sig_end = length(h);

h_transpose = h.';

X_window = zeros(1,sig_end);
;
y = zeros(1, length(x) + sig_end - 1)


for i = 1:length(x)+sig_end-1
     if i <= length(x);
        X_window = [x(i), X_window(1:end-1)]; % Shift the window and update with the current input value
     end
     if i > length(x)
         X_window = [0, X_window(1:end-1)];
     end
    y(i) = sum(X_window .* h); 
end


subplot(3,1,1)
stem(h)


subplot(3,1,2)
stem(x)


subplot(3,1,3)
stem(y)