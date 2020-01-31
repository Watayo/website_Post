# carrierwaveのクラス作成
class PhotoUploader < CarrierWave::Uploader::Base
  storage :file
    # include CarrierWave::MiniMagick

    # #サムネイル画像の生成
    # version :thumb do
    #     process :resize_to_fill => [200, 200]
    # end

    # #縮小画像の生成
    # version :small do
    #     process :resize_to_limit => [900, 900]
    # end

    # #ファイル名を一意に ex.b52d259b93.jpg
    # def filename
    #      "#{secure_token(10)}.#{file.extension}" if original_filename.present?
    # end

    # protected
    # def secure_token(length=16)
    #     var = :"@#{mounted_as}_secure_token"
    #     model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    # end
end
