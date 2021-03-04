function preview() {
  const ImageList = document.getElementById('image-list');
  document.getElementById('item-image').addEventListener("change",function(e){

    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }
    
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    const imageElement = document.createElement('div');
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src',blob);
    blobImage.setAttribute('class',"image-list")

    ImageList.appendChild(imageElement);
    imageElement.appendChild(blobImage);
  });
};

window.addEventListener('load',preview)