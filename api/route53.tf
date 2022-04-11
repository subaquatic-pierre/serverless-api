data "aws_route53_zone" "main" {
  name         = var.domain_name
  private_zone = false
}


resource "aws_api_gateway_base_path_mapping" "main" {
  api_id      = aws_api_gateway_rest_api.main.id
  domain_name = aws_api_gateway_domain_name.main.domain_name
  stage_name  = aws_api_gateway_stage.main.stage_name
}

resource "aws_route53_record" "api" {
  name    = "api.${var.domain_name}"
  type    = "A"
  zone_id = data.aws_route53_zone.main.zone_id

  alias {
    name                   = aws_api_gateway_domain_name.main.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.main.cloudfront_zone_id
    evaluate_target_health = false
  }
}



resource "aws_api_gateway_domain_name" "main" {
  domain_name = "api.${var.domain_name}"

  certificate_arn = aws_acm_certificate.main.arn
}

resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in aws_acm_certificate.main.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.main.zone_id

}
