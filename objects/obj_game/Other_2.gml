cameraX = 0;
cameraY = 0;

cameraWidth = 960;
cameraHeight = 720;

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], cameraWidth, cameraHeight);

displayScale = 2;
displayWidth = cameraWidth * displayScale;
displayHeight = cameraHeight * displayScale;

window_set_size(displayWidth, displayHeight);

surface_resize(application_surface, displayWidth, displayHeight);

window_center();


function resize(_scale)
{
	displayScale = _scale;
	displayWidth = cameraWidth * displayScale;
	displayHeight = cameraHeight * displayScale;

	window_set_size(displayWidth, displayHeight);

	surface_resize(application_surface, displayWidth, displayHeight);
	
	window_center();
}



