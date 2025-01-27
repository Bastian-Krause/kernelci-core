# SPDX-License-Identifier: LGPL-2.1-or-later
#
# Copyright (C) 2019, 2023 Linaro Limited
# Author: Dan Rue <dan.rue@linaro.org>
#
# Copyright (C) 2019, 2020, 2023 Collabora Limited
# Author: Guillaume Tucker <guillaume.tucker@collabora.com>

test: \
	pylint \
	pycodestyle \
	unit-tests \
	validate-yaml

pylint:
	pylint --reports=y \
		kci \
		kernelci.api \
		kernelci.cli \
		kernelci.config.api \
		kernelci.config.runtime \
		kernelci.storage \
		setup.py \
		tests

pycodestyle:
	pycodestyle kernelci
	pycodestyle kci
	pycodestyle kci_*
	pycodestyle scripts/*
	pycodestyle tests/*
	pycodestyle setup.py

unit-tests:
	python3 -m pytest tests

validate-yaml:
	./kci validate yaml
	./kci_build validate
	./kci_test validate
	./kci_data validate
	./kci_rootfs validate
