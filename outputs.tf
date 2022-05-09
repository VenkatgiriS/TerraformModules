output vpc_id {
    value = "${module.capgemini.vpcid}"
}
output sn1 {
    value = "${module.capgemini.subnet1id}"
}
output sn2 {
    value = "${module.capgemini.subnet2id}"
}
output sn3 {
    value = "${module.capgemini.subnet3id}"
}
output sg {
<<<<<<< HEAD
    value = "${module.opstree.sgid}"
}
=======
    value = "${module.capgemini.sgid}"
}
>>>>>>> parent of 1446cc8 (jenkins installation)
