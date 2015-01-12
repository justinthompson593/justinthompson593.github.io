% Character strings
x = 'Hello AMATH301!'
y = 'How are you today?'
z = [x y] % Concatenate

%%

% demo of max
% help max
A = [1 3 2; 5 6 7; 8 3 1]

%%

oneOutput = max(A)

%%

[maxA,location] = max(A)

%%
[maxA,location] = max(A,[],1)

%%
%
[maxA,location] = max(A,[],2)

%%
[maxA,location] = max(A(:))    % Regardless of dimension

%%

% Define function
f = @(x) exp(x) - tan(x)

x=-10:0.05:10;  y=f(x);     % Define the values

figure                     % Set up the plotting environment
subplot(2,2,1);            % Multiple panels (2 by 2; use the first panel)

plot(x,y,'or','MarkerSize',2,'LineWidth',3);  % Plot x, y in red

% Modify the plotting properties
set(gca,'YLim',[-10,10],'XLim',[-5,5],'FontSize',15);                  % font size on the axes
xlabel('X values');                   
ylabel('Y values');                   
title('Manipulating plots in Matlab');   % title of the plot

% Overplot another curve
y1=exp(-x);                        % Another y values
hold on                           % Keep the current plot
plot(x,y1,'.b','LineWidth',2); % Plot y1 as a dotted blue line
hold off                          % Release the current plot from holding

subplot(2,2,2)
plot(1:20,sin(1:20))

subplot(2,2,3:4);          % Multiple panels (3 by 1; use the third panel)
x2=1:0.2:4;  y2=log(x2);     % Define the values
plot(x2,y2,'og','LineWidth',2); % Plot y1 as a dotted blue line

% Save as a PDF file
print -dpdf sample.pdf



%%
vec = rand(20,1)


save B2.dat vec -ascii




