void initializeTheThings() {
  ks = new Keystone(this);
  surface = ks.createCornerPinSurface(width, height, 20);
  // // create a buffer to store the scene we want to render
  // // on the projection mapped surface
  offscreenCanvas = createGraphics(width, height, P2D);
  // // ^ this can be 2D or 3D renderer, but we use 2D
  // // because it seems to be more performant
  
  // // the mapping image' aspect ratio
  // // must be the same as the display window
  mappingImg = loadImage("image.jpg");
  // // Load the movie to replace moving pixels with
  movie = new Movie(this, "video.mov");
  // // create new Kinect2 object
  kinect2 = new Kinect2(this);
  // // initialize the infrared emitter
  kinect2.initIR();
  // // initialize all the data
  kinect2.initDevice();
  
  // // total number of pixels in the scene
  numPixels = width * height;
  // // Create an array to store the previously captured frame
  previousFrame = new int[numPixels];
  
  // // Limit our renderspace to non-black pixels
  // // in the original mappingImg:
  renderSpace = CreateRenderspace(mappingImg);
  
  // // ...or comment out the following 
  // // to just render everywhere:
  // renderSpace = new int[numPixels];
  //for(int i=0; i<numPixels; i++) {
  //  renderSpace[i] = i;
  //}
  
  // // Start looping the movie
  movie.loop();
}