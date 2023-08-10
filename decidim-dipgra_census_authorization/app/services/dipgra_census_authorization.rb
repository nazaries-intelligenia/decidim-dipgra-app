# frozen_string_literal: true

class DipgraCensusAuthorization
  DipgraCensusData = Struct.new(:document_type, :id_document, :birthdate)

  def initialize(config)
    @username = config[:username]
    @password = config[:password]
    @organization = config[:organization]
  end

  def call(document_type:, id_document:, birthdate:)
    request = build_request
    raw_response = request.send_rq(document_type:, id_document:, birthdate:)
    response = DipgraCensusAuthorizationRs.new(raw_response)
    return unless response.birth_date.present? && response.active?

    DipgraCensusData.new(document_type, id_document, response.birth_date)
  end

  private

  def build_request
    DipgraCensusAuthorizationRq.new(username: @username, password: @password, organization: @organization)
  end
end
