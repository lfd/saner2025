#!/bin/bash

# SPDX-FileCopyrightText: 2025 OTH Regensburg, Nicole Hoess <nicole.hoess@othr.de>
# SPDX-License-Identifier: GPL-2.0-only

source analysis.conf

# Analyse all subject projects with Kaiaulu.
for project in ${project_list[*]}
  do
    bash "$kaiaulu_path"/analysis.sh "${project}"
  done