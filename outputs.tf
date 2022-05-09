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
    value = "${module.opstree.sgid}"
}
