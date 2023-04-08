 source "yandex" "ubuntu-nginx" {
   token               = "y0_AgAAAAA_cOD6AATuwQAAAADe7ElNbm8pMI0sTi29Lj107ekrz2bA24Q"
   folder_id           = "b1gk6tppjabch1pugb7g"
   source_image_family = "ubuntu-2004-lts"
   ssh_username        = "ubuntu"
   use_ipv4_nat        = "true"
   image_description   = "my custom ubuntu with nginx"
   image_family        = "ubuntu-2004-lts"
   image_name          = "my-ubuntu-nginx"
   subnet_id           = "e9bsnlr9p9ej69117eu4"
   disk_type           = "network-ssd"
   zone                = "ru-central1-a"
 }

 build {
   sources = ["source.yandex.ubuntu-nginx"]

   provisioner "shell" {
     inline = ["sudo apt-get update -y",
           "sudo apt-get install -y nginx",
           "sudo systemctl enable nginx.service"]
   }
 }
 