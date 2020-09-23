all:  policy
POLICY := gjyoung1974/policy:latest

policy:
	docker build --pull --rm --label org.label-schema.vcs-url=https://github.com/gjyoung1974/policy.git  -f "Dockerfile" --tag $(POLICY) "."

push:
	docker push $(POLICY)
