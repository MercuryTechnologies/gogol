{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- |
-- Module      : Gogol.ContainerBuilder.Cloudbuild.Projects.Locations.Builds.Approve
-- Copyright   : (c) 2015-2022 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+gogol@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Approves or rejects a pending build. If approved, the returned LRO will be analogous to the LRO returned from a CreateBuild call. If rejected, the returned LRO will be immediately done.
--
-- /See:/ <https://cloud.google.com/cloud-build/docs/ Cloud Build API Reference> for @cloudbuild.projects.locations.builds.approve@.
module Gogol.ContainerBuilder.Cloudbuild.Projects.Locations.Builds.Approve
  ( -- * Resource
    CloudbuildProjectsLocationsBuildsApproveResource,

    -- ** Constructing a Request
    newCloudbuildProjectsLocationsBuildsApprove,
    CloudbuildProjectsLocationsBuildsApprove,
  )
where

import Gogol.ContainerBuilder.Types
import qualified Gogol.Prelude as Core

-- | A resource alias for @cloudbuild.projects.locations.builds.approve@ method which the
-- 'CloudbuildProjectsLocationsBuildsApprove' request conforms to.
type CloudbuildProjectsLocationsBuildsApproveResource =
  "v1"
    Core.:> Core.CaptureMode "name" "approve" Core.Text
    Core.:> Core.QueryParam "$.xgafv" Xgafv
    Core.:> Core.QueryParam "access_token" Core.Text
    Core.:> Core.QueryParam "callback" Core.Text
    Core.:> Core.QueryParam "uploadType" Core.Text
    Core.:> Core.QueryParam "upload_protocol" Core.Text
    Core.:> Core.QueryParam "alt" Core.AltJSON
    Core.:> Core.ReqBody '[Core.JSON] ApproveBuildRequest
    Core.:> Core.Post '[Core.JSON] Operation

-- | Approves or rejects a pending build. If approved, the returned LRO will be analogous to the LRO returned from a CreateBuild call. If rejected, the returned LRO will be immediately done.
--
-- /See:/ 'newCloudbuildProjectsLocationsBuildsApprove' smart constructor.
data CloudbuildProjectsLocationsBuildsApprove = CloudbuildProjectsLocationsBuildsApprove
  { -- | V1 error format.
    xgafv :: (Core.Maybe Xgafv),
    -- | OAuth access token.
    accessToken :: (Core.Maybe Core.Text),
    -- | JSONP
    callback :: (Core.Maybe Core.Text),
    -- | Required. Name of the target build. For example: \"projects\/{$project/id}\/builds\/{$build/id}\"
    name :: Core.Text,
    -- | Multipart request metadata.
    payload :: ApproveBuildRequest,
    -- | Legacy upload protocol for media (e.g. \"media\", \"multipart\").
    uploadType :: (Core.Maybe Core.Text),
    -- | Upload protocol for media (e.g. \"raw\", \"multipart\").
    uploadProtocol :: (Core.Maybe Core.Text)
  }
  deriving (Core.Eq, Core.Show, Core.Generic)

-- | Creates a value of 'CloudbuildProjectsLocationsBuildsApprove' with the minimum fields required to make a request.
newCloudbuildProjectsLocationsBuildsApprove ::
  -- |  Required. Name of the target build. For example: \"projects\/{$project/id}\/builds\/{$build/id}\" See 'name'.
  Core.Text ->
  -- |  Multipart request metadata. See 'payload'.
  ApproveBuildRequest ->
  CloudbuildProjectsLocationsBuildsApprove
newCloudbuildProjectsLocationsBuildsApprove name payload =
  CloudbuildProjectsLocationsBuildsApprove
    { xgafv = Core.Nothing,
      accessToken = Core.Nothing,
      callback = Core.Nothing,
      name = name,
      payload = payload,
      uploadType = Core.Nothing,
      uploadProtocol = Core.Nothing
    }

instance
  Core.GoogleRequest
    CloudbuildProjectsLocationsBuildsApprove
  where
  type
    Rs CloudbuildProjectsLocationsBuildsApprove =
      Operation
  type
    Scopes CloudbuildProjectsLocationsBuildsApprove =
      '[CloudPlatform'FullControl]
  requestClient
    CloudbuildProjectsLocationsBuildsApprove {..} =
      go
        name
        xgafv
        accessToken
        callback
        uploadType
        uploadProtocol
        (Core.Just Core.AltJSON)
        payload
        containerBuilderService
      where
        go =
          Core.buildClient
            ( Core.Proxy ::
                Core.Proxy
                  CloudbuildProjectsLocationsBuildsApproveResource
            )
            Core.mempty
