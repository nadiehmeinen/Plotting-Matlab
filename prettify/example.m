% clearvars
close all
clc


x = 0:0.1:10;
y = sin(x);

plot(x,y)
xlabel('X label')
ylabel('Y label')
text(3, 0.5, 'LaTeX formula: $\alpha_\mathrm{\theta} = 1 + e^{-\pi}$')

title('My title')

legend('My legend')



prettify(gcf)