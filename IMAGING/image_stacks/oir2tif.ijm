folder = getDirectory("File directory");
suffix = "oir";

processFolder(folder);
print("DONE")

function processFolder(folder) {
    list = getFileList(folder);
    for (i = 0; i < list.length; i++) {
        if(File.isDirectory(list[i]))
            processFolder("" + folder + list[i]);
        if(endsWith(list[i], suffix))
            processFile(folder, list[i]);
    }
}
 
function processFile(folder, file) {
    // do the processing here by replacing
    // the following two lines by your own code
    print("Processing: " + folder + file);
    //open(folder + file)
    run("Bio-Formats Importer", "open=" + folder + file + " color_mode=Grayscale view=Hyperstack stack_order=XYCZT");
    print("Saving to: " + folder);
    saveAs("TIFF", folder+file);
    close();
    //File.delete(folder + file);
}