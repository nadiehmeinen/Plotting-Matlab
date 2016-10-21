clearvars
close all
clc


x = 0:0.1:10;
y = sin(x);

plot(x,y)
xlabel('X label')
ylabel('Y label')

title('My title')

legend('My legend')



prettify(gcf)