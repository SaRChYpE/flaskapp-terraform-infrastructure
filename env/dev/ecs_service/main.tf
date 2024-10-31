provider "aws" {
  region = var.region
}

module "ecs" {
  source = "../../../modules/ecs_service"
  env = "dev"
  ecs_cluster_id = data.terraform_remote_state.ecs_cluster.outputs.ecs_cluster_id
  ecs_task_definition_arn = data.terraform_remote_state.ecs_task.outputs.ecs_task_definition_arn
  subnets = [data.terraform_remote_state.subnet.outputs.subnet_id, data.terraform_remote_state.subnet.outputs.subnet2_id]
  sg_id = data.terraform_remote_state.sg.outputs.sg_id
  ecs_capacity_provider_name =  data.terraform_remote_state.ecs_cluster.outputs.ecs_capacity_provider_name
  ecs_tg_arn = data.terraform_remote_state.alb.outputs.ecs_tg_arn
  ecs_asg = data.terraform_remote_state.asg.outputs.ecs_asg
}