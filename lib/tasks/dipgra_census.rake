# frozen_string_literal: true

#
# A set of utils to manage and validate verification related data.
#
namespace :dipgra_census do
  desc "Checks the given credentials against the Dipgra Census (document_type dni/nie/passport, birthdate yyyy/mm/dd)"
  task :check, [:org_id, :document_type, :id_document, :birthdate] => :environment do |_task, args|
    organization = Decidim::Organization.find(args.org_id)
    document_type = args.document_type&.to_sym
    id_document = args.id_document
    birthdate = Time.strptime(args.birthdate, "%Y/%m/%d")

    puts <<~EOMSG
      Performing request with parameters:
      birthdate: #{birthdate}
      document_type: #{DipgraCensusAuthorizationConfig::DOCUMENT_TYPE[document_type]}
      id_document: #{id_document}
    EOMSG

    puts "\nRESPONSE:"
    service = DipgraCensusAuthorizationRq.new(DipgraCensusAuthorizationConfig.api_config(organization))
    rs = service.send_rq(
      birthdate:,
      document_type: DipgraCensusAuthorizationConfig::DOCUMENT_TYPE[document_type],
      id_document:
    )
    puts "RS: #{rs.body}"
    puts "Extracted RS: #{parse_response(rs)}"
  end

  def parse_response(response)
    # The *real* response data is encoded as a xml string inside a xml node.
    parsed = Nokogiri::XML(response.body).remove_namespaces!
    Nokogiri::XML(parsed.xpath("//servicioResponse")[0])
  end

  desc "Returns the DipgraCensusAuthorizationHandler encoded version of the document argument"
  task :to_unique_id, [:document] => :environment do |_task, args|
    puts to_unique_id(args.document)
  end

  desc "Is there a Decidim::Authorization for the given document"
  task :find_authorization_by_doc, [:document, :birthdate] => :environment do |_task, args|
    authorization= Decidim::Authorization.find_by(unique_id: to_unique_id(args.document))
    puts authorization
  end

  def to_unique_id(document)
    Digest::SHA256.hexdigest("#{document}-#{Rails.application.secrets.secret_key_base}")
  end
end
