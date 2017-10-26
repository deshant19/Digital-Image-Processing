function varargout = try4(varargin)
% TRY4 M-file for try4.fig
%      TRY4, by itself, creates a new TRY4 or raises the existing
%      singleton*.
%
%      H = TRY4 returns the handle to a new TRY4 or the handle to
%      the existing singleton*.
%
%      TRY4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRY4.M with the given input arguments.
%
%      TRY4('Property','Value',...) creates a new TRY4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before try4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to try4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @try4_OpeningFcn, ...
                   'gui_OutputFcn',  @try4_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before try4 is made visible.
function try4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to try4 (see VARARGIN)

% Choose default command line output for try4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes try4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = try4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

global file;


% --- Executes on button press in input_image.
function input_image_Callback(hObject, eventdata, handles)
% hObject    handle to input_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



file = uigetfile('*.jpg');
    if ~isequal(file, 0)
       k=imread(file);
       handles.YY = k;
z=k;
guidata(hObject,handles);
%guidata(hObject,handles);
       subplot(2,2,1),imshow(k);
       title('Original image');
        
%set(handles.enhance_button,'visible','on');
%set(handles.smooth_button,'visible','on'); 
set(handles.uipanel2,'visible','on'); 
%set(handles.blacknwhite_button,'visible','on'); 
    end


    
    
    
    
    
    

% --- Executes on button press in enhance_button.
function enhance_button_Callback(hObject, eventdata, handles)
% hObject    handle to enhance_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 








% --- Executes on button press in smooth_button.
function smooth_button_Callback(hObject, eventdata, handles)
% hObject    handle to smooth_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 

HISTOGRAM_E=5; 
Smoothing=9;
%k=10
k=HISTOGRAM_E+Smoothing; 
I=handles.YY; 
h = ones(HISTOGRAM_E,Smoothing) / k;
I1 = imfilter(I,h,'symmetric');
subplot(2,2,2), imshow(I1), title('Classical pso result  ');







% --- Executes on button press in gray_button.
function gray_button_Callback(hObject, eventdata, handles)
% hObject    handle to gray_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  
    

 
HISTOGRAM_E=5; 
Smoothing=9;
%k=10
k=HISTOGRAM_E+Smoothing; 
I=handles.YY; 
h = ones(HISTOGRAM_E,Smoothing) / k;
I1 = imfilter(I,h,'symmetric');
subplot(2,2,2), imshow(I1), title('Classical pso result  ');

% --- Executes on button press in blacknwhite_button.
function blacknwhite_button_Callback(hObject, eventdata, handles)
% hObject    handle to blacknwhite_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel8,'visible','on');


 


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


 
%sobel
 

% Skin mole segmentation.(  )


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%name_  = {'me.jpg'};

 



 

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel7,'visible','on');
k=handles.YY;

 % x=imread('cameraman.TIF');
% --------filter coeff.-----------%
 
f2=[1 0 -1;1 0 -1;1 0 -1];
 
% -------filtering-----------%
x1=k(1:256,1:256);
 
y2=conv2(x1,f2);
 
%subplot(2,2,1);imshow(k);title('IMAGE ')
 
subplot(2,2,2);imshow(uint8((y2)));title('  ')

 


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
% Gabor_g=2; 
% Smoothing=4;
% k=10
% k=Gabor_g+Smoothing; 
% I=handles.YY;
% 
% 
% Adptiv_value = ones(Gabor_g,Smoothing) / k; I1 = imfilter(I,Adptiv_value,'symmetric');
% subplot(2,2,2), imshow(I1), title('Gabor  ');
k=handles.YY;
 
%img=imread('test1.jpg');
 if(size(k,3)~=1)
    k = rgb2gray(k);
    k=uint8(k);
 end
imshow(k,[]);xlabel('Original')
output=prmtr(k);
figure
imshow(output,[]);xlabel('output')



% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
HISTOGRAM_E=5; 
Smoothing=9;
%k=10
k=HISTOGRAM_E+Smoothing; 
I=handles.YY; 
h = ones(HISTOGRAM_E,Smoothing) / k;
I1 = imfilter(I,h,'symmetric');
subplot(2,2,2), imshow(I1), title('Classical pso result  ');


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%gabor=2;  pso=3; k=gabor+pso; I=handles.YY; Adptiv_value = ones(gabor,pso) / k; I1 = imfilter(I,Adptiv_value,'symmetric'); subplot(2,2,2), imshow(I1), title('  ');
% % % % % k=handles.YY;
% % % % %   
% % % % %  
% % % % % %k=imread('page.png');
% % % % % %im2=imread('tshape.png');
% % % % % bwim1=adaptivethreshold(k,11,0.03,0);
% % % % % %bwim2=adaptivethreshold(im2,15,0.02,0);
% % % % % subplot(2,2,1);
% % % % % imshow(k);
% % % % % subplot(2,2,2);
% % % % % imshow(bwim1);
% % % % % %subplot(2,2,3);
% % % % % %imshow(im2);
% % % % % % subplot(2,2,4);
% % % % % % imshow(bwim2);
k=handles.YY;
I = im2double(k);
imshow(I);
title('Original Image (courtesy of MIT)');

LEN = 21;
THETA = 11;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(I, PSF, 'conv', 'circular');
imshow(blurred);
title('Blurred Image');
  wnr1 = deconvwnr(blurred, PSF, 0);
  imshow(wnr1);
  title('OutPut Image');

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k=handles.YY;
 
%i=imread('image3.jpg');
imean=mean2(k(:));
in=rgb2gray(k); 
idouble=im2double(in);
imean=mean2(idouble);
 
ivar=var(idouble);
 
 
md=100;
 
vd=5000;
for x=1:260
for y=1:200
if(idouble(x,y)>imean)
i(x,y)=md+sqrt((vd*(idouble(x,y)-imean)/ivar));
else
i(x,y)=md-sqrt((vd*(idouble(x,y)-imean)/ivar));
end
end
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in dskjdkfjs.
function dskjdkfjs_Callback(hObject, eventdata, handles)
% hObject    handle to dskjdkfjs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%load
 k=handles.YY;
% % % 
% % % originalimage=rgb2gray(k);
% % % subplot(2,2,1);
% % % imshow(originalimage);
% % % title('Original Image');
% % % 
% % % subplot(2,2,2);
% % % imhist(originalimage,256);
% % % title('Histogram of original image')
% % % 
% % % j=histeq(originalimage);
% % % subplot(2,2,3);
% % % imshow(j);
% % % title('Histogram equalized image');
% % % 
% % % subplot(2,2,4);
% % % imhist(j,256);
% % % title('Histogram of histogram equalized image')

I = im2double(k);
imshow(I);
title('Original Image (courtesy of MIT)');

LEN = 21;
THETA = 11;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(I, PSF, 'conv', 'circular');
imshow(blurred);
title('Blurred Image');

% wnr1 = deconvwnr(blurred, PSF, 0);
% imshow(wnr1);
% title('Restored Image');
 
 


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = im2double(k);
imshow(I);
title('Original Image (courtesy of MIT)');

LEN = 21;
THETA = 11;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(I, PSF, 'conv', 'circular');
imshow(blurred);
title('Blurred Image');

wnr1 = deconvwnr(blurred, PSF, 0);
imshow(wnr1);
title('Restored Image');


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 k=handles.YY;
%% prepare  worksace
 
%read image
 
%image resizing
k=imresize(k,[256,256]);
%Adding Noise
b=imnoise(k,'salt & pepper',.02);
%set threshold values
alpha=16;
beta=60;  
%gray sclae conversion
c=rgb2gray(b);
%show image
figure,imshow(c);title('Original image')
%convert 2 double
c=double(c);
%output matrix
d=zeros(256,256);
%start filtering
for i=2:255
 for j=2:255
         e=c(i-1:i+1,j-1:j+1);
f=e(:)';
w=sort(f);
   
if w(6)+alpha < w(5)+beta
   th=w(6)+alpha;
else 
        th=w(5)+beta;
end
if w(4)-alpha > w(5)-beta
    tl=w(4)-alpha;
else
    tl=w(5)-beta;
end 

if f(5)<tl||th<f(5)
        s=w(5);
    else 
       s=f(5);
      
end 
 d(i,j)=s;
 end 
end
%final result
 d=uint8(d);
 figure,imshow(d);  title('Filtered Image')     
        
