%% Signal Construction

w=20*pi;

t1=0;

t2=1;

step=0.00000001;

t=t1:step:t2;

signal=4*cos(w*t);


plot(t,signal)

xlabel('t')
ylabel('x(t)')
title('signal x(t)')


%% Sampling
fs=70;

ts=1/fs;

n=t1:1:fs*t2;

N=n*ts;

Xn=4*cos(w*n*ts);

stem(N,Xn)

xlabel('nTs')
ylabel('x(nTs)')
title('Sampled signal x(n)')
%% Sampling with orignal signal

plot(t,signal)

hold on

stem(N,Xn)

xlabel('t')
ylabel('x(nTs) and x(t)')
title('Sampled signal x(n) with signal x(t)')

%% Quantization

bits=4;

levels=(2^bits);

quantized=zeros(1,length(n));

amplitude=4;

delta=(2*amplitude)/(levels);

max=amplitude-delta/2;

min=-amplitude+delta/2;

for i=min:delta:max
    for j=1:length(n)
        if(((i-delta/2)<=Xn(j))&&(Xn(j)<=(i+delta/(2))))
            quantized(j)=i;
        end
    end
end

stem(N,quantized)

xlabel('nTs')
ylabel('xq(nTs)')
title('quantized signal xq(n)')
%% Quantization with sampled signal
stem(N,Xn)

hold on

stem(N,quantized)

title('quantized signal xq(n) with xs(t)')
legend("sampled","quantized")
%% Quantization with orignal signal
plot(t,signal)

hold on

stem(N,quantized)

title('quantized signal xq(n) with x(t)')
%% Encoding

pcm=[zeros(1,length(quantized))];

temp=-amplitude+delta/2;

for i=1:length(quantized)
    for j=1:(levels)
    if((quantized(i)==(temp)))
        pcm(i)=j-1;
        break;
    else
        temp=(temp+delta);
    end
    end
    temp=-amplitude+delta/2;
end

pcm; % Encoded in decimal. 

pcm_binary = decimalToBinaryVector(pcm,bits); % Predefined function
pcm_binary; % Encoded in binary. 


