resource "opennebula_virtual_machine" "ubuntu" {
  count = var.conteo_instancias

  template_id = var.opennebula_template_id

   name = "ubuntu-22-04${count.index +1}"

  cpu    = 0.5
  memory = 1024
  group  = var.opennebula_group

  context = {
    START_SCRIPT = "apt update"
  }

  nic {
    model      = "virtio"
    network_id = var.opennebula_network_id
  }

  disk {
    image_id = var.opennebula_image_id
    target   = "vda"
    size     = 8192
  }

}
