function anime(f,go,t1,t,s_int)






  c = s_int * conv(f, go);


% flip 'go(t1)' for the graphical convolutions g = go(-t1)
  g = fliplr(go);
  tf = fliplr(-t1);

% slide range of 'g' to discard non-ovelapping areas with 'f' in the convolution
  tf = tf + ( min(t)-max(tf) );

% get the range of function 'c' which is the convolution of 'f(t)' and 'go(t1)'
  tc = [ tf t(2:end)];
  tc = tc+max(t1);

 axis_color= [0.5 0.5 0.5];

% plot f(t) and go(t1)  
  ax_1 = subplot(3,1,1);
  op = stem(t,f);
  hold on; grid on;
  set(ax_1, 'XColor', axis_color, 'YColor', axis_color, 'Color', 'w', 'Fontsize', 9);
  xlim( [ ( min(t)-abs(max(tf)-min(tf)) - 1 ) ( max(t)+abs(max(tf)-min(tf)) + 1 ) ] );
  title('x[n]', 'Color', axis_color );
  legend({'f(t)' 'go(t)'});

% initialize animation the plot of 'g' is slided over the plot of 'f'

% plot f in the subplot number 2
  ax_2 = subplot(3,1,2);
  p = stem(t, f);
  hold on; grid on;
  title('Graphical Convolution: x[n]*h[n]', 'Color', axis_color );
  
% plot g in the subplot number 2
  q = stem(tf, g, 'r');
  xlim( [ ( min(t)-abs(max(tf)-min(tf))-1 ) ( max(t)+abs(max(tf)-min(tf))+1 ) ] );
  u_ym = get(ax_2, 'ylim');

% plot two vertical lines to show the range of ovelapped area
  s_l = line( [min(t) min(t)], [u_ym(1) u_ym(2)], 'color', 'g'  );
  e_l = line( [min(t) min(t)], [u_ym(1) u_ym(2)], 'color', 'g'  );
  hold on; grid on;
  set(ax_2, 'XColor', axis_color, 'YColor', axis_color, 'Color', 'w', 'Fontsize', 9);

  % put a yellow shade on ovelapped region
  sg = rectangle('Position', [min(t) u_ym(1) 0.0001 u_ym(2)-u_ym(1)], ...
                 'EdgeColor', 'w', 'FaceColor', 'y');
  
  
% initialize the plot the convolution result 'c'
  ax_3 = subplot(3,1,3);
  r = stem(tc, c);
  grid on; hold on;
  set(ax_3, 'XColor', axis_color, 'YColor', axis_color, 'Fontsize', 9);
  % xlim( [ min(tc)-1 max(tc)+1 ] );
  xlim( [ ( min(t)-abs(max(tf)-min(tf)) - 1 ) ( max(t)+abs(max(tf)-min(tf)) + 1 ) ] );
  title('Convolutional Product', 'Color', axis_color );

% animation block
  for i=1:length(tc)
    
    % control speed of animation minimum is 0, the lower the faster
      pause(0.01);
      drawnow;
      
    % update the position of sliding function 'g', its handle is 'q'
      tf=tf+s_int;
      set(q);
      set(q,'XData',tf,'YData',g);

    % show overlapping regions
    
    % show a vetical line for a left boundary of overlapping region
      sx = min( max( tf(1), min(t) ), max(t) );  
      sx_a = [sx sx];
      set(s_l);
      set(s_l, 'XData', sx_a);

    % show a second vetical line for the right boundary of overlapping region
      ex = min( tf(end), max(t) );  
      ex_a = [ex ex];
      set(e_l);
      set(e_l, 'XData', ex_a);
      
    % update shading on ovelapped region
      rpos = [sx u_ym(1) max(0.0001, ex-sx) u_ym(2)-u_ym(1)];  
      set(sg, 'Position', rpos);
      
    % update the plot of convolutional product 'c', its handle is r
      set(r);
      set(r,'XData',tc(1:i),'YData',c(1:i) );
    
  end

  %inspiration
%acnv.m by Laine Berhane Kahsay
