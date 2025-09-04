resource "aws_elasticache_replication_group" "redis-cmd" {
  automatic_failover_enabled = true
  multi_az_enabled           = true
  replication_group_id       = "elasticache-learning-cmd"
  description                = "A cluster mode disabled redis cluster for testing"
  cluster_mode               = "disabled"
  engine                     = "redis"
  engine_version             = "7.1"
  node_type                  = "cache.t4g.micro"
  num_cache_clusters         = 2
  parameter_group_name       = "default.redis7"
  port                       = 6379
  subnet_group_name          = "skyforge-subnet-group"
  security_group_ids         = ["sg-07597827c4cfe1432"]
}

resource "aws_elasticache_serverless_cache" "redis-serverless" {
  engine = "valkey"
  name   = "elasticache-learning-serverless"
  cache_usage_limits {
    data_storage {
      maximum = 1
      unit    = "GB"
    }
    ecpu_per_second {
      maximum = 1000
    }
  }
  description              = "Serverless cache for testing purpose"
  major_engine_version     = "8"
  snapshot_retention_limit = 1
  subnet_ids               = ["subnet-0da96ed78aad5112a", "subnet-0825cfaba77828b79", "subnet-0fd27a11576a595f4"]
  security_group_ids       = ["sg-07597827c4cfe1432"]
}

resource "aws_elasticache_replication_group" "redis-cme" {
  automatic_failover_enabled = true
  multi_az_enabled           = true
  replication_group_id       = "elasticache-learning-cme"
  description                = "A cluster mode disabled redis cluster for testing"
  cluster_mode               = "enabled"
  engine                     = "valkey"
  engine_version             = "8.1"
  node_type                  = "cache.t4g.micro"
  num_node_groups            = 2
  replicas_per_node_group    = 1
  parameter_group_name       = "default.valkey8.cluster.on"
  port                       = 6379
  subnet_group_name          = "skyforge-subnet-group"
  security_group_ids         = ["sg-07597827c4cfe1432"]
}
