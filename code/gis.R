

library(terra)

# Assuming you have a folder containing multiple raster files (replace with your actual folder path)
raster_folder <- "D:/fuels_review_gis"


# Create a function to convert raster to shapefile
convert_raster_to_shapefile <- function(raster_file) {
  # Read in the raster
  r <- rast(raster_file)
  
  # Convert raster cells to polygons (non-NA values)
  pr <- as.polygons(r > -Inf)
  
  # Save the polygon as a shapefile
  output_shapefile <- paste0("output_", tools::file_path_sans_ext(basename(raster_file)), ".shp")
  writeVector(pr, output_shapefile, )
  
  # Print a success message
  cat("Shapefile", output_shapefile, "created.\n")
}

# Get all TIFF files in the folder
tif_files <- list.files(raster_folder, pattern = "\\.tif$", full.names = TRUE)

# Create an output folder
dir.create("output", showWarnings = FALSE)

# Loop through each raster file and create shapefiles
for (tif_file in tif_files) {
  convert_raster_to_shapefile(tif_file)
}

