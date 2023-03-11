@Configuration
public class ModelMapperConfig {
    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();
        PropertyMap<RbaResult, RbaResultDto> resultDtoPropertyMap = new PropertyMap<RbaResult, RbaResultDto>() {
            protected void configure() {
                map().setManualComment(source.getManualComment() != null ? source.getManualComment() : null);
                map().setManualEditTime(source.getManualEditTime() != null ? source.getManualEditTime() : null);
                map().setManualVerify(source.getManualVerify() != null ? source.getManualVerify() : null);
            }
        };
        modelMapper.addMappings(resultDtoPropertyMap);
        return modelMapper;
    }
}
