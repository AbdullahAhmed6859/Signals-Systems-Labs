%% Task1
x = [2, 4, 5, 9];
y = x .* x;
y

%% Task 2A
a = [
    2 5 3
    1 1 0
    9 6 -1
    ];
b = [
    -1
    6
    9
    ];
c = [3 -2 4];
x = a * b
y = a + 4
z = b .* a
c = c.^ 2

%% Task 2B
a = [3 2 4];
b = [4 2 3];
% a)
ta = transpose(a)
tb = transpose(b)
% b)
ta .* a
tb .* b
% c)
a .* tb
b .* ta

%% Task 3(a)
k = 50;
freq1 = 3;
t1=0:1/(freq1 * 50):4/freq1;
y1 = sin(2 * pi * freq1 .*t1);
figure
plot(t1, y1)
title('Plotting y(t)');
xlabel('y-axis');
ylabel('t-axis');

freq2 = 300;
t2=0:1/15000:4/300;
y2 = sin(2 * pi * freq2 .*t2);
figure
plot(t2, y2)
title('Plotting y(t)');
xlabel('y-axis');
ylabel('t-axis');


%% Task 3(b)
a1 = 0.01;
t1=0:1/(3 * a1):8/a1;
y1 = 1 - exp(-1 * a1 .*t1);
figure
plot(t1, y1)
title('Plotting y(t)');
xlabel('y-axis');
ylabel('t-axis');

a2 = 100;
t2=0:1/(3 * a2):8/a2;
y2 = 1 - exp(-1 * a2 .*t2);
figure
plot(t2, y2)
title('Plotting y(t)');
xlabel('y-axis');
ylabel('t-axis');

%% Task 4

% Plotting 1st function
subplot (3,1,1) %1st plot
x=-3:1:3;
m = x.^2;

plot(x, m,'k','LineWidth',2.5)
title('Plotting m(x)');
xlabel('x');
ylabel('Amplitude');

% Plotting 2nd function
subplot (3,1,2) %2nd plot
x = -3:0.1:3;
n = 2.5 * (x.^2);

plot(x, n,'r')
title('Plotting n(x)');
xlabel('x');
ylabel('Amplitude');

% Plotting 3rd function
subplot (3,1,3) %3rd plot
x=-5:0.01:5;
p = 2*(x.^2);

plot(x, p,'g*')
title('Plotting p(x)');
xlabel('x');
ylabel('Amplitude');

% Adding main/super title
sgtitle ('Non-linear graphs') %ignore this command if gives error

%% Task 5
% b)
B = [eye(2), rand(2, 1)];
B
size(B)

% b)
v = zeros(1, 36); % Create a row vector with 36 zeros
v(18) = 1;        % Set the 18th element to 1
v

