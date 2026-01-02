data "aws_cloudfront_cache_policy" "cdn_enable" {
  name = "Managed-CachingOptimized"
}

data "aws_cloudfront_cache_policy" "cdn_disable" {
  name = "Managed-CachingDisabled"
}

data "aws_ssm_parameter" "acm_certificate_arn" {
  name = "/${var.project_name}/${var.environment}/acm_certificate_arn"
}
