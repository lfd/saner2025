#! /bin/bash

# SPDX-License-Identifier: GPL-2.0-only
# SPDX-FileCopyrightText: 2025 OTH Regensburg, Nicole Hoess <nicole.hoess@othr.de>

# Start MySQL service
sudo service mysql start

# Start ID service accessing the database
cd /home/saner/tools/codeface/id_service
bash start_id_service.sh&

# Prepare for user interaction
mysql -u codeface -pcodeface codeface < /home/saner/tools/codeface/docker/config.sql
source /home/saner/.bashrc
/bin/bash
