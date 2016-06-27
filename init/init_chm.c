/*
   Copyright (c) 2016, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

typedef struct {
    const char *model;
    const char *description;
    const char *fingerprint;
    const char *mainkeys;
} match_t;

static match_t matches[] = {
    /* HUAWEI ALE-CL00 */
    {
        "HUAWEI ALE-CL00",
        "ALE-CL00-user 5.1.1 GRJ90 C567B140 release-keys",
        "HUAWEI/ALE-CL00/ALE-CL00-Q:5.1.1/HUAWEIALE-CL00/C567B140:user/release-keys",
        "0"
    },
    /* HUAWEI CHM-CL00 */
    {
        "HUAWEI CHM-CL00",
        "CHM-CL00-user 5.1.1 GRJ90 C567B140 release-keys",
        "HONOR/CHM-CL00/CHM-CL00-Q:5.1.1/HONORCHM-CL00/C567B140:user/release-keys",
	"1"
    },
    { 0, 0, 0, 0 }
};

void vendor_load_properties()
{
    char platform[PROP_VALUE_MAX];
    char model[110];
    FILE* fp;
    int rc;
    match_t *match;

    rc = property_get("ro.board.platform", platform);
    if (!rc || strncmp(platform, ANDROID_TARGET, PROP_VALUE_MAX))
        return;

    fp = fopen("/proc/app_info", "rb");
    while (fgets(model, 100, fp))
        if (strstr(model, "huawei_fac_product_name") != NULL)
            break;

    for (match = matches; match->model; match++) {
        if (strstr(model, match->model)) {
            property_set("ro.build.product", match->model);
            property_set("ro.product.device", match->model);
            property_set("ro.product.model", match->model);
            property_set("ro.build.description", match->description);
            property_set("ro.build.fingerprint", match->fingerprint);
            property_set("qemu.hw.mainkeys", match->mainkeys);
            break;
        }
    }
}
